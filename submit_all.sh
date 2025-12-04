#!/bin/bash
# =========================================
# Wrapper-Skript zum automatischen Starten
# aller JATI-Jobs für mehrere Input-Dateien
# =========================================

# ---- Verzeichnisse und Konstanten ----
DATA_DIR=/cfs/earth/scratch/pungiele/jati_work/data/benchmark-datasets/aa/hard
OUTDIR=/cfs/earth/scratch/pungiele/jati_work/results/aa_hard
SCRIPT=/cfs/earth/scratch/pungiele/jati_work/scripts/jati_pip_parameters_directory.submit

# ---- Fixe Parameter ----
MODEL=WAG
GAPS=pip
EPSILON=0.5
MAX_ITERS=5

# ---- Logverzeichnis vorbereiten ----
mkdir -p "${OUTDIR}/logs"

# ---- Alle Dateien (.fasta, .fas, .aln) finden ----
shopt -s nullglob
files=( "${DATA_DIR}"/*.fasta "${DATA_DIR}"/*.fas "${DATA_DIR}"/*.aln )
shopt -u nullglob

if [ ${#files[@]} -eq 0 ]; then
  echo "❌ Keine Eingabedateien in ${DATA_DIR} gefunden!"
  exit 1
fi

echo "📂 Finde ${#files[@]} Dateien in ${DATA_DIR}"
echo "🚀 Starte Jobs für alle Dateien ..."

# ---- Schleife über alle Dateien ----
for SEQ_FILE in "${files[@]}"; do
  bname=$(basename "$SEQ_FILE")
  stem=${bname%.*}

  echo "Submitting job for ${bname}"
  sbatch \
    --partition=earth-3 \
    --time=24:00:00 \
    --output="${OUTDIR}/logs/${stem}-%j.out" \
    --export=SEQ_FILE="${SEQ_FILE}",MODEL="${MODEL}",GAPS="${GAPS}",EPSILON="${EPSILON}",MAX_ITERS="${MAX_ITERS}",OUTDIR="${OUTDIR}" \
    "${SCRIPT}"
done

echo "✅ Alle Jobs eingereicht."


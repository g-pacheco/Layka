#!/bin/bash

#SBATCH --partition=intel-128               # Particao
#SBATCH --cpus-per-task=8                   # CPUs solicitados
#SBATCH --hint=compute_bound                # Um processador por core
#SBATCH --mail-type=ALL                     # Quando um e-mail deve ser enviado?
#SBATCH --mail-user=marimiravasc@gmail.com  # Qual e-mail deve ser usado?
#SBATCH --time=0-1:0                        # Formato padrao: Dias-Horas:Minutos


# Paralelizacao (OpenMP) parametros:

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true

# Rode abaixo o seu comando:

eval "$(conda shell.bash hook)" # inclua esta linha antes executar o conda
conda activate /home/sbbe26/conda/ipyrad
ipyrad -p params-tutorial.txt -c 8 -s 7 -f

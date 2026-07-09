#!/bin/bash

#SBATCH --partition=intel-128               # Particao
#SBATCH --cpus-per-task=2                   # CPUs solicitados
#SBATCH --hint=compute_bound                # Um processador por core
#SBATCH --mail-type=none                     # Quando um e-mail deve ser enviado?
#SBATCH --time=0-1:0                        # Formato padrao: Dias-Horas:Minutos


# Allows Conda enviroments ~
eval "$(conda shell.bash hook)"

# Starts Plink environment ~
conda activate /home/sbbe26/conda/plink

# Runs PCA ~
plink --bfile ../tutorial_pruned --pca 20 --out ./tutorial_pruned_PCA --allow-extra-chr

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

# Converts .VCF into .BED ~
plink --vcf ../tutorial_outfiles/tutorial.vcf --make-bed --out ./tutorial --double-id --allow-extra-chr

# Calculates LD ~
plink --bfile ./tutorial --maf 0.05 --geno 0.05 --indep-pairwise 50 5 0.2 --out ./tutorial_LD --allow-extra-chr

# Prunes for LD ~
plink --bfile ./tutorial --extract ./tutorial_LD.prune.in --make-bed --out ./tutorial_pruned --allow-extra-chr

# Edits .BIM file ~
#sed -i 's/^RAD_//' ./tutorial_pruned.bim

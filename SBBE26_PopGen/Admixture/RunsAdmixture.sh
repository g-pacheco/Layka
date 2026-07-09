#!/bin/bash

#SBATCH --partition=intel-128               # Particao
#SBATCH --cpus-per-task=4                   # CPUs solicitados
#SBATCH --hint=compute_bound                # Um processador por core
#SBATCH --mail-type=none                    # Quando um e-mail deve ser enviado?
#SBATCH --time=0-1:0                        # Formato padrao: Dias-Horas:Minutos

# Edits .BIM file ~
sed -i 's/^RAD_//' ../tutorial_pruned.bim

# Runs Admixture ~
for K in $(seq 1 4);
        do /home/sbbe26/admixture_linux-1.4.0/admixture --cv ../tutorial_pruned.bed $K -j4 | tee log_${K}.out;
done

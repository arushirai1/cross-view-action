#!/bin/bash
#SBATCH --nodes=1                      # Get one node
#SBATCH --cpus-per-task=4              # Two cores per task
#SBATCH --ntasks=2                     # But only one task
#SBATCH --mem-per-cpu=16gb
#SBATCH --gres-flags=enforce-binding   # Insist on good CPU/GPU alignment
#SBATCH --gres=gpu:1                   # And two GPU
#SBATCH --time=10:00:00              # Run for 7 days, at most
#SBATCH --job-name=cross-subject-i3d              # Name the job so I can see it in squeue
#SBATCH --output=cross-subject-i3d-%J.out
#SBATCH --mail-type=BEGIN,END,FAIL     # Send me email for various states
#SBATCH --mail-user arai4@hawk.iit.edu        # Use this address

module load anaconda/anaconda3
module load cuda/cuda-11.0

source activate cv-arushi
python train.py


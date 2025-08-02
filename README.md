# Master's Thesis: Causal AI in Marketing Measurement

This repository contains the code and notebooks developed for my Master's thesis on **Causal Artificial Intelligence (Causal AI)** and its applications in marketing measurement, experimentation, and decision-making. The work applies causal inference tools like **DoWhy**, **EconML**, **Causica**, and **GCM** to  simulated marketing data.

---

## Contents

###  Causal Graph & Assumptions

- `CausalGraphValidation.ipynb`  
  *Purpose:* Formalizes structural assumptions as Directed Acyclic Graphs (DAGs) and validates them using DoWhy and domain knowledge.  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

- `Causal_assumptions_checks.ipynb`  
  *Purpose:* Implements checks for key assumptions such as ignorability, overlap, and consistency using graphical and empirical methods.  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

---

###  Estimation & Simulation

- `CausalAI_DoWhy_EconML_masters_.ipynb`  
  *Purpose:* Estimates Average Treatment Effects (ATE), Conditional ATE (CATE), and Individual Treatment Effects (ITE) using DoWhy + EconML meta-learners.  
  *Related Chapter:*  Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference
  Linear and nonlinear datasets

- `SiMMMulator_GCM_DoWhy_EconML.ipynb`  
  *Purpose:* Simulates marketing data using `siMMMulator`, then applies multiple causal inference pipelines (DoWhy, GCM, EconML) to estimate treatment effects.  
  *Related Chapter:*  Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference
 

- `SiMMMulator.R`  
  *Purpose:* R script for generating synthetic marketing data (adstock, saturation, noise, etc.) with known causal structure using the `siMMMulator` package.  **The actual dataset generated is also in the repo.**
  *Related Chapter:*  Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

---

###  Root Cause & Causal Discovery

- `DoWhy_GCM_RootCauseMasters_.ipynb`  
  *Purpose:* Explores root-cause attribution and anomaly explanation using DoWhy-GCM methods such as arrow strength, intrinsic contribution, and counterfactual change attribution.  
  *Related Chapter:*  Chapter 7  Methodology and Results 2: Graphical Causal Models

- `CausicaMasters (1).ipynb`  
  *Purpose:* Trains Microsoft's Causica model to learn latent causal structure and infer treatment effects using probabilistic graphical models.  
  *Related Chapter:* Chapter 7  Methodology and Results 2: Graphical Causal Models 

---


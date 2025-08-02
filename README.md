# Master's Thesis: Causal AI in Marketing Measurement

This repository contains the code and notebooks developed for my Master's thesis on **Causal Artificial Intelligence (Causal AI)** and its applications in marketing measurement, experimentation, and decision-making. The work applies causal inference tools like **DoWhy**, **EconML**, **Causica**, and **GCM** to simulated marketing data.

---

## Contents

### 📊 Causal Graph & Assumptions

- `CausalGraphValidation.ipynb`  
  *Purpose:* Formalizes structural assumptions as Directed Acyclic Graphs (DAGs) and validates them using DoWhy and domain knowledge.  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

- `Causal_assumptions_checks.ipynb`  
  *Purpose:* Implements checks for key assumptions such as ignorability, overlap, and consistency using graphical and empirical methods.  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

---

### 🎯 Estimation & Simulation

- `CausalAI_DoWhy_EconML_masters_.ipynb`  
  *Purpose:* Estimates Average Treatment Effects (ATE), Conditional ATE (CATE), and Individual Treatment Effects (ITE) using DoWhy + EconML meta-learners on linear and nonlinear datasets.  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

- `SiMMMulator_GCM_DoWhy_EconML.ipynb`  
  *Purpose:* Simulates marketing data using `siMMMulator`, then applies multiple causal inference pipelines (DoWhy, GCM, EconML) to estimate treatment effects.  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

- `SiMMMulator.R`  
  *Purpose:* R script for generating synthetic marketing data (adstock, saturation, noise, etc.) with known causal structure using the `siMMMulator` package. **The actual dataset generated is also included in the repo.**  
  *Related Chapter:* Chapter 6: Methodology and Results 1: Conventional Statistics vs Causal Inference

---

###  Root Cause & Causal Discovery

- `DoWhy_GCM_RootCauseMasters_.ipynb`  
  *Purpose:* Explores root-cause attribution and anomaly explanation using DoWhy-GCM methods such as arrow strength, intrinsic contribution, and counterfactual change attribution.  
  *Related Chapter:* Chapter 7: Methodology and Results 2: Graphical Causal Models

- `CausicaMasters (1).ipynb`  
  *Purpose:* Trains Microsoft's Causica model to learn latent causal structure and infer treatment effects using probabilistic graphical models.  
  *Related Chapter:* Chapter 7: Methodology and Results 2: Graphical Causal Models

---

### Educational Examples & Classic Cases

- `Simpson_Paradox_Berkeley_Admissions.ipynb`  
  *Purpose:* Analysis of Simpson's Paradox applied to the famous Berkeley admissions scandal, demonstrating how aggregate statistics can mislead without proper causal reasoning and the importance of controlling for confounders.  
  *Related Chapter:* Chapter 3: Correlation and Causation / Chapter 4: Frameworks for Causal Inference

---

## Repository Structure

```
├── README.md
├── notebooks/
│   ├── CausalGraphValidation.ipynb
│   ├── Causal_assumptions_checks.ipynb
│   ├── CausalAI_DoWhy_EconML_masters_.ipynb
│   ├── SiMMMulator_GCM_DoWhy_EconML.ipynb
│   ├── DoWhy_GCM_RootCauseMasters_.ipynb
│   ├── CausicaMasters (1).ipynb
│   └── Simpson_Paradox_Berkeley_Admissions.ipynb
├── data/
│   └── [Generated siMMMulator datasets]
└── scripts/
    └── SiMMMulator.R
```

## Key Research Questions Addressed

1. **RQ1**: Assumption validation & diagnostics
2. **RQ2**: Structural discovery and causal graph learning  
3. **RQ3**: Effect estimation (ATE/ITE) accuracy
4. **RQ4**: Intervention simulation ("what-if" futures)
5. **RQ5**: Counterfactual reconstruction ("alternative pasts")
6. **RQ6**: Root-cause analysis of performance shifts

## Technologies Used

- **Python**: DoWhy, EconML, Causica, DoWhy-GCM
- **R**: siMMMulator package for synthetic data generation



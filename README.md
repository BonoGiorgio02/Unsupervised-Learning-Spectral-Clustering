# Spectral Clustering

## Overview

This project implements Spectral Clustering algorithms in MATLAB as part of the Homework 2 assignment for the course Computational Linear Algebra for Large Scale Problems at Politecnico di Torino.
The goal is to cluster non-linearly separable datasets (e.g., Circle, Spiral, 3D spheres) using graph-based methods and spectral analysis of the Laplacian matrix.

## Methodology

Graph Construction:
  - The dataset points are represented as nodes.
  - The similarity between points is encoded using a k-nearest neighbors (kNN) graph (`knn_graph.m`).
  - 
**Laplacian Matrix**:
The normalized symmetric Laplacian $ \( L_{sym} = D^{-1/2} (D - W) D^{-1/2} \) $ is computed using `compute_Lsym.m`.

**Spectral Decomposition**:
The smallest eigenvalues and corresponding eigenvectors are extracted (`compute_eigenpairs.m`, `inverse_power_method.m`).
These eigenvectors define a low-dimensional embedding of the data.

**Clustering**:
Standard clustering (e.g., k-means) is applied to the spectral embedding.
The algorithm is evaluated on the Circle and Spiral datasets to verify its ability to separate non-linear clusters.

## Results

Successfully separates complex, non-linearly separable datasets such as concentric circles and intertwined spirals.
Demonstrates the power of Spectral Clustering compared to standard Euclidean distance-based methods.

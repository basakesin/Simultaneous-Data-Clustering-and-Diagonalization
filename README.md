# Simultaneous Data Clustering and Diagonalization

This repository is an MATLAB implementation of simultaneous data clustering and diagonalization. 

This code identifies the distinct clusters in a dataset X with three clusters C_1, C_2 and C_3. The created toy dataset with original clusters are shown below.

![Original Dataset](https://raw.githubusercontent.com/basakesin/Simultaneous-Data-Clustering-and-Diagonalization/master/Figures/ToyData_Original.tif)

We have used gamma normalization on data before the clustering for better distinction. After gamma normalization, estimated clusters are represented below.

![Estimated Clusters on Gamma Normalized Scale](https://raw.githubusercontent.com/basakesin/Simultaneous-Data-Clustering-and-Diagonalization/master/Figures/Estimated%20Clusters%20on%20Gamma%20Normalized%20Scale.tif)
![Estimated Clusters on Raw Data](https://raw.githubusercontent.com/basakesin/Simultaneous-Data-Clustering-and-Diagonalization/master/Figures/Estimated%20Clusters%20on%20Raw%20Data.tif)

Then joint diagonalization of clusters are performed via FFDIAG algorithm and diagonalized clusters are shown below.

![Diagonalized Data] (https://raw.githubusercontent.com/basakesin/Simultaneous-Data-Clustering-and-Diagonalization/master/Figures/Diagonalized%20Clusters.tif)

##Usage
----
Run 
```
JointClusteringandDiagonalization.m
```

## Dependencies
-----
 This package have required following toolboxes.
 
 QSL toolbox to estimate the posterior probabilities; 
 
 qsl package is avaliable on [here] (http://web.iyte.edu.tr/~bilgekaracali/Projects/QSL/qsl.tar.gz)
 
 ICALAB Toolbox for joint diagonalization (FFDIAG);
 
 icalab toolbox, available on [here] (http://www.bsp.brain.riken.jp/ICALAB/ICALABSignalProcDownload.php)

ABMFEM Matlab Toolbox for data clustering;

ABMFEM Matlab Toolbox available on [here] (https://github.com/basakesin/ABMFEM)
 
## Author
----
Basak Esin KOKTURK GUZEL

## Credits
----

 If you use this code, please cite:

 Köktürk, Başak Esin, and Bilge Karaçalı. "Annealing-based model-free expectation maximisation for
 multi-colour flow cytometry data clustering." International Journal of Data Mining and Bioinformatics 14,
 no. 1 (2016): 86-99.
 
## License
----
 The abmfem package is free software; you can redistribute it and/or  modify it under the terms of the GNU General Public License as 
 published by the Free Software Foundation; either version 3 of the License, or any later version. 
 
The software package is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even 
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 

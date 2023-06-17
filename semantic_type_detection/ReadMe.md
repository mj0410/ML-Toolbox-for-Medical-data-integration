### Semantic Type Detection

- *Sato* detects the semantic type of table columns
- A hybrid machine learning model consisting of a neural network, LDA, and CRF
- *Sherlock* + global context (the topic of the table) and local context (semantic types of neighboring columns)

##### Model Structure

<br/>

<img src="https://github.com/mj0410/MLToolbox-for-MedicalDI/blob/main/IMAGE/sato_structure.PNG" width="600"> 

<br/>

##### Latent Dirichlet Allocation (LDA)
- A generative probabilistic model of topics present in a collection of documents
- Assumes that the given documents are represented as a fixed set of latent topics and each topic is determined by a distribution over words

##### Conditional Random Field (CRF)
- A framework building a discriminative probabilistic model to label and segment sequential data
- outperform generative models and other conditional models
- widely adapted for various problems, such as named entity recognition, information extraction, image labeling, and others.

# 12. MLOps — Operationalizing Machine Learning

MLOps (Machine Learning Operations) bridges the gap between building ML models and deploying them reliably in production.

## 1. The ML Lifecycle
1. **Data Collection & Preparation**: Gathering, cleaning, and labeling data.
2. **Feature Engineering**: Creating meaningful inputs for models (Feature Stores like Feast, Tecton).
3. **Model Training**: Running experiments, hyperparameter tuning.
4. **Model Evaluation**: Metrics, validation, and A/B testing.
5. **Model Deployment**: Serving predictions (batch vs. real-time).
6. **Monitoring & Retraining**: Detecting drift and triggering retraining pipelines.

## 2. Experiment Tracking
- **MLflow**: Open-source platform for the complete ML lifecycle.
- **Weights & Biases (W&B)**: Experiment tracking, dataset versioning, and model visualization.
- **Neptune.ai**: Metadata store for MLOps teams.
- **Key Concepts**: Logging metrics, parameters, artifacts, and model versions.

## 3. Model Registry & Versioning
- **MLflow Model Registry**: Stage transitions (Staging → Production → Archived).
- **DVC (Data Version Control)**: Git for data — version datasets alongside code.
- **Model Cards**: Documentation of model performance, bias, and intended use.

## 4. CI/CD for ML
- **CML (Continuous Machine Learning)**: CI/CD for ML projects by Iterative.ai.
- **GitHub Actions + ML**: Automating training, testing, and deployment.
- **Key Difference from Software CI/CD**: You must also test *data quality* and *model performance*, not just code.

## 5. Feature Stores
- **What**: A centralized repository for storing, sharing, and serving ML features.
- **Feast**: Open-source feature store.
- **Tecton**: Managed feature platform.
- **Why**: Avoids duplicating feature engineering logic across teams.

## 6. Model Serving
| Method | Latency | Use Case |
| :--- | :--- | :--- |
| **REST API** (Flask/FastAPI) | Medium | General purpose |
| **gRPC** (TF Serving) | Low | High-throughput |
| **Batch** (Spark/Airflow) | High | Offline predictions |
| **Edge** (ONNX/TFLite) | Very Low | Mobile/IoT |

## 7. Monitoring & Drift Detection
- **Data Drift**: Input data distribution changes over time.
- **Concept Drift**: The relationship between input and output changes.
- **Tools**: Evidently AI, Whylogs, Arize AI.
- **Alerting**: Set thresholds on model accuracy and trigger retraining pipelines.

## 8. Infrastructure
- **Kubernetes + KubeFlow**: Orchestrating ML workloads at scale.
- **Ray**: Distributed computing framework for ML.
- **SageMaker / Vertex AI**: Managed cloud ML platforms.

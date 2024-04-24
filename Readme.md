# Documentation

## Overview

`Sw_data_filtering` is a data engineering project built for data mesh architecture, featuring multiple layers for efficient data processing and filtering. IAM policies are implemented to limit user access to tables and queries, enabling segregation between PII data and normal data. While Lambdas provide scalability, an EMR cluster is a superior option for real-time processing, although not implemented due to cost constraints.

## Technologies Used

- **Cloud Provider**: AWS (Amazon Web Services)
- **Infrastructure as Code**: Terraform
- **Orchestrator**: Airflow
- **Execution Language**: Python
- **Continuous Integration / Continuous Deployment (CI/CD)**: GitHub Actions
- **Containerization**: Docker

## AWS Services Utilized

- **Lambda**: Used for data ingestion and processing.
- **ECR (Elastic Container Registry)**: Stores Lambda function images built from Dockerfile.
- **DynamoDB**: Used to lock Terraform state files while the written is made in S3.
- **S3**: Used alongside DynamoDB to store Terraform state files, stores the lambda logs for airflow, stores the athena database and the data-mesh base files .
- **Glue**: Utilized for data catalogs.
- **Athena**: Used for data visualization and querying.
- **Network Settings**: Configured to facilitate communication for Lambdas.

## Project Architecture

The project architecture consists of the following components:

- **Lambda Functions**: Responsible for data ingestion and processing. Docker images are utilized for Lambda functions.
- **Terraform**: Used for infrastructure provisioning and management.
- **Airflow DAGs**: Trigger Lambda functions periodically (e.g., every 3 minutes) for near real-time processing.
- **GitHub Actions**: Used for CI/CD pipelines, including Docker image builds and Terraform commands execution.

## Testing

- **Local Testing**: Airflow DAGs can be tested locally using Astro. Simply place the DAGs in the appropriate folder (`dags`) and ensure Python packages used are installed.
- **Cloud Testing**: Testing in the cloud environment mirrors local testing procedures.

## Git Actions Configuration

- **Runner**: Ubuntu-latest.
- **Secrets Required**: `ecr_repo_name`, `aws_access_key_id`, and `aws_secret_access_key`.
- **Image Tagging**: Commit hash + timestamp for Docker image tags.

## Data Mesh Considerations

- **IAM Policies**: Implemented to restrict user access to specific tables and data types (e.g., PII data).
- **Scalability**: Lambdas provide scalability; however, for real-time processing at scale, EMR clusters would be more suitable (not implemented due to cost considerations).

## Getting Started

To deploy and utilize the `Sw_data_filtering` project, follow these steps:

1. Clone the repository.
2. Configure AWS credentials and ensure Terraform is installed.
3. Set up secrets in GitHub repository for CI/CD.
4. Modify Airflow DAGs as needed for specific data processing requirements.
5. Run Terraform commands to provision infrastructure.
6. Trigger CI/CD pipelines for deployment and testing.
7. Monitor Airflow DAGs for data processing and ingestion.

## Conclusion

`Sw_data_filtering` is a comprehensive data engineering project leveraging cloud-native services and IAC practices to facilitate near real-time data processing and filtering. With proper configuration and setup, it provides a robust framework for handling large volumes of data efficiently.


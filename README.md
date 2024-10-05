
# Project Name

Briefly describe the purpose of your dbt project. What problem does it solve, and who is it for?

## Table of Contents

1. [Project Overview](#project-overview)
2. [Getting Started](#getting-started)
3. [Project Structure](#project-structure)
4. [Data Sources](#data-sources)
5. [Models](#models)
6. [Testing and Validation](#testing-and-validation)
7. [Contributing](#contributing)
8. [License](#license)

## Project Overview

This dbt project is a playground for me to try out new things that come up with dbt

## Getting Started

Instructions on how to set up and run the project locally. Include:

1. **Prerequisites**: 
- Download [Visual Studio Code](https://code.visualstudio.com/)
- Download [Docker](https://www.docker.com/)
- Install the following packages in Visual Studio Code
    - Dev Containers
    - Power User for dbt
    - Docker
2. **Database Connection**: 
Navigate to your profiles.yml file 
``` mkdir -p ~/.dbt && touch ~/.dbt/profiles.yml && nano ~/.dbt/profiles.yml ```

Fill out the profiles yml as follows 
```my_project:
  target: dev
  outputs:
    dev:
      type: bigquery
      project: your_project_id
      dataset: your_dataset_name
      threads: 4
      keyfile: /path/to/your/service-account-key.json
    prod:
      type: bigquery
      project: your_project_id
      dataset: your_dataset_name
      threads: 4
      keyfile: /path/to/your/service-account-key.json```

my_project: The name of your dbt project. Change this to match your project name.
target: Specifies the environment you want to use (in this case, dev).
outputs: Contains configurations for your database environments.
dev: Configuration for the development environment.
type: Set to bigquery for Google BigQuery.
project: Your Google Cloud project ID.
dataset: The BigQuery dataset where dbt will create tables and views.
threads: The number of threads dbt can use for running models concurrently.
keyfile: The path to your service account JSON key file for authentication.
prod: Similar configuration for the production environment.

Things to note:
1. Replace your_project_id and your_dataset_name with your actual Google Cloud project ID and BigQuery dataset name.
2. Ensure that the keyfile path points to your service account key file, which should have the necessary permissions to access BigQuery.


## Project Structure

Briefly describe the dbt project's folder structure, so people can quickly understand how things are organized.

```
.
├── models/
│   ├── staging/
│   ├── marts/
│   ├── intermediate/
├── macros/
```

You can explain the role of each folder, such as:

- **`models/staging/`**: Contains the raw staging tables.
- **`models/marts/`**: The final data models ready for consumption.
- **`models/transforms/`**: Any transformations or intermediate models used in data processing.

## Testing and Validation

Outline any dbt tests you're using to ensure data quality and integrity. Mention tests like:

- Schema tests (e.g., uniqueness, non-null)
- Custom tests (e.g., specific logic checks)

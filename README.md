# mlflow
mlflow practicse
#MLFLOW
mlflow.set_experiment("tracking-demo")
with mlflow.start_run()
    model = train(...)
    ...
    ...
    mlflow.log_param("test_size",test_size)
    mlflow.log_metric("F1_score",f1_score)
    mlflow.log_figure(figure,"figure.png")

CLI command - mlflow ui

# STORAGE TYPES
where are runs are recorded. follwoing options

    local files
    a sqlaclhemy compatabile database
    remote tracking servers
    databricks workspace

MLFLow storage components

        BACKEND STORE  -Databases
            runs, parameters,metrics, tags, notes, metadata
        ARTIFACT STORE - Google storage
            files, models, images, model,summary

SCENARIO 1 : MLFLOW on localhost
    both backend and artifact on local directory

SCENARIO 2  : MLFlow on localhost with sqlite
    mlflow entities are stored in a sqlite database file
    artifacts on local run dirctory

SCENARIO 3 : MLflow on localhost with tracking server
    similar as scenario 1 ..mlflow interacts with tracking server via rest api

    mlflow creats an instanance of rest store and sends rest api request to log mlflow ...trackign server creates an instance of file store ot save mlflow entities and 

    mflow send a rest request to get artifact store uri location. ml flow stores artifacts at the uri location


SCENARIO 4 : MLflow with remote tracking server, backend (postegreals sql) and artifact stores (S3)


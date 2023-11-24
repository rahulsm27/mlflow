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

------------X----------------X-------------------

MLFLOW PROJECTS

Format for packaging data science code in a reusable and reproducible way.


MLproject file
    NAME
    Entry points
    Environment

# EXAMPLE BELOW

        name: My Project

        python_env: python_env.yaml
        # or
        # conda_env: my_env.yaml
        # or
        # docker_env:
        #    image:  mlflow-docker-example

        entry_points:
        main:
            parameters:
            data_file: path
            regularization: {type: float, default: 0.1}
            command: "python train.py -r {regularization} {data_file}"
        validate:
            parameters:
            data_file: path
            command: "python validate.py {data_file}"


--------------X-----------------------X-----------------
MLflow Models
pakacgse ML models that can be used for 
    real time serving through a REST API
    batch inference on APache spark

MLFlow model is a directory containing files that encapsulates information about everthing necessay to run the model
    MLModel
    model.pkl
    conda.yaml - for conda
    requirements.txt - wtihtout conda

signature = infer_signature(model_input,model_output) # for infering type of model
mflflow.sklearn.log_model(model,"model",signature=signature)
flavours - sklearn,pytoch..based on package
if sutiable flavour not available create based on pyfunc
see lecture 98 models.handson


we can store our models . above four files are avialble in ml ui cli 

ML flow also helps us to serve ML models as endpoints like flask

----------------X ---------------_X---------
MLFlow model Registry - For version setup of ml flow models

SOurce code - git
Dataset -DVC
Models -  ML Flow Model registry

Two ways 

USING ML UI

1. ML ui
 - Go to models section
 - Click on create
 - give name basic sentiment classifer

2. go to run - select model. select register model

USING PYTHON
    add argument in mlflow.log_model


--------X-----------X----------------

Local MLFlow setup





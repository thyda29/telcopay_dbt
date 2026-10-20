# telcopay_dbt
dbt project for the TelcoPay Medallion pipeline. Reads Silver tables (`workspace.silver`), writes views to
`dbt_staging` and tables to `dbt_marts`, and tests the rules enforced in the Silver notebook.

    pip install dbt-databricks
    cp profiles.yml.example ~/.dbt/profiles.yml   # fill in host, http_path; export DBT_DATABRICKS_TOKEN
    dbt debug
    dbt run
    dbt test
    dbt docs generate && dbt docs serve

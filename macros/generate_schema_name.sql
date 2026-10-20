{# Use the custom schema exactly as written (dbt_staging / dbt_marts) instead of <target_schema>_<custom>.
   Keeps dbt output in its own schemas, separate from silver and gold. #}
{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}

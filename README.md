# Population SQL Analysis

A beginner-to-intermediate SQL project that analyzes historical population data using **MySQL**.

The project focuses on practical SQL skills such as filtering, sorting, aggregation, subqueries, `CASE`, `JOIN`, grouping, calculated columns, and ranking.

## Recommended Repository Name

**`population-sql-analysis`**

This name is short, professional, easy to search, and clearly communicates that the repository contains a SQL-based population analysis project.

## Project Files

```text
population-sql-analysis/
│
├── population.csv
├── population_analysis.sql
└── README.md
```

### File Description

| File | Purpose |
|---|---|
| `population.csv` | Raw population dataset |
| `population_analysis.sql` | Database setup and 7 SQL analysis queries |
| `README.md` | Project documentation |

---

## Project Objective

The objective of this project is to use SQL to explore population trends across countries and other entities over time.

The analysis answers seven practical questions:

1. What is the latest population for every entity?
2. Which 10 entities have the largest population in the latest year?
3. How has India's population changed over time?
4. How much did India's population grow from the first to latest year?
5. What was India's average population in each decade?
6. Which entities had at least 100 million people in 2023?
7. Which entities had the highest percentage population growth from 1950 to 2023?

The questions are intentionally designed to be understandable to **freshers, beginners, and intermediate SQL learners** while still demonstrating useful real-world SQL techniques.

---

## Dataset

The dataset comes from **Our World in Data** and is based on the **United Nations World Population Prospects 2024**.

The downloaded data package describes each row as an observation for an entity at a specific timepoint. The CSV contains:

- `Entity` — country, region, or other population entity
- `Code` — entity code
- `Year` — observation year
- `all years` — population value

The project renames `all years` to `Population` when creating the SQL table because `Population` is clearer and easier for SQL analysis.

### Dataset Summary

| Item | Value |
|---|---|
| Rows | 19,388 |
| Columns | 4 |
| Entities | 262 |
| Year range | 1950–2023 |
| Unit | People |
| Population measurement | 1 July of the year shown |
| Main source | UN World Population Prospects 2024 |
| Data processor | Our World in Data |

> **Important:** The dataset includes not only individual countries but also regions and other aggregate entities. Therefore, the word **entity** is used throughout this project instead of assuming every row represents a country.

---

## Tools & Technologies

- **MySQL 8.0+**
- **MySQL Workbench** (recommended for beginners)
- SQL
- CSV

No Python, Excel, Power BI, or external libraries are required to run the SQL analysis.

---

## SQL Concepts Used

This project demonstrates the following SQL concepts:

- `CREATE DATABASE`
- `CREATE TABLE`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `GROUP BY`
- Aggregate functions: `MIN()`, `MAX()`, `AVG()`
- `ROUND()`
- `FLOOR()`
- `CASE`
- Subqueries
- `JOIN`
- Calculated columns
- Percentage calculations
- Table aliases

---

## Database Setup

### 1. Install MySQL

Install **MySQL 8.0 or later**.

MySQL Workbench is recommended because it makes CSV importing easier for beginners.

### 2. Open MySQL Workbench

Create a new SQL tab and run:

```sql
CREATE DATABASE population_analysis;
USE population_analysis;
```

### 3. Create the Table

Run:

```sql
CREATE TABLE population (
    Entity VARCHAR(150),
    Code VARCHAR(20),
    Year INT,
    Population BIGINT
);
```

### 4. Import the CSV

Use:

**MySQL Workbench → Table Data Import Wizard**

Select:

```text
population.csv
```

Map the CSV columns as follows:

| CSV Column | MySQL Column |
|---|---|
| Entity | Entity |
| Code | Code |
| Year | Year |
| all years | Population |

The raw CSV is not modified. Only the SQL table uses the clearer column name `Population`.

---

## Running the Project

After importing the data:

1. Open `population_analysis.sql`.
2. Select the `population_analysis` database.
3. Run the queries individually.
4. Review the result grid in MySQL Workbench.
5. Compare results across years and entities.
6. Use the queries as a starting point for additional analysis.

---

# SQL Analysis Questions

## Q1. What is the latest population for every entity?

### SQL Skills

- `MAX()`
- Subquery
- `WHERE`
- `ORDER BY`

### Purpose

Finds the most recent year available in the dataset and displays the population of every entity for that year.

---

## Q2. Which 10 entities have the largest population in the latest year?

### SQL Skills

- Subquery
- `ORDER BY`
- `LIMIT`

### Purpose

Ranks entities by their latest available population and returns only the top 10.

This is useful for practicing ranking and limiting results.

---

## Q3. How has India's population changed over time?

### SQL Skills

- `WHERE`
- `ORDER BY`

### Purpose

Filters the dataset to India and displays its population year by year.

This query can later be used as the source for a line chart in a visualization tool.

---

## Q4. How much did India's population grow from the first to latest year?

### SQL Skills

- `JOIN`
- `MIN()`
- `MAX()`
- Subqueries
- Calculated column

### Purpose

Compares India's population in the first available year with its population in the latest available year.

The query calculates:

```text
Population Growth = Latest Population - First Population
```

---

## Q5. What was India's average population in each decade?

### SQL Skills

- `AVG()`
- `GROUP BY`
- `FLOOR()`
- `ROUND()`

### Purpose

Groups India's yearly population into decades and calculates the average population for each decade.

Example:

```text
1950s → 1950
1960s → 1960
1970s → 1970
```

---

## Q6. Which entities had at least 100 million people in 2023?

### SQL Skills

- Multiple `WHERE` conditions
- Comparison operators
- `ORDER BY`

### Purpose

Identifies entities with a population of at least 100 million in 2023 and sorts them from largest to smallest.

---

## Q7. Which entities had the highest percentage population growth from 1950 to 2023?

### SQL Skills

- Self-join
- Table aliases
- Calculated columns
- Percentage calculation
- `ORDER BY`
- `LIMIT`

### Purpose

Compares the 1950 and 2023 population values for the same entity and calculates percentage growth.

Formula:

```text
Growth % = ((2023 Population - 1950 Population) / 1950 Population) × 100
```

---

# Beginner Learning Path

If you are new to SQL, study the queries in this order:

```text
Q3 → Q6 → Q2 → Q1 → Q5 → Q4 → Q7
```

### Why this order?

| Stage | Queries | Main Learning |
|---|---|---|
| Beginner | Q3, Q6 | `SELECT`, `WHERE`, `ORDER BY` |
| Beginner+ | Q2, Q1 | `LIMIT`, `MAX()`, subqueries |
| Intermediate | Q5 | Aggregation and grouping |
| Intermediate | Q4 | `JOIN` + subqueries |
| Intermediate+ | Q7 | Self-join + percentage calculation |

---

# Possible Business / Analytical Insights

Although this is a learning project, the queries demonstrate how SQL can support population analysis.

The analysis can help answer questions such as:

- Which entities currently have the largest populations?
- How has India's population changed over time?
- Which entities crossed the 100-million population level?
- How large was population growth over the available period?
- How does population behavior differ by decade?
- Which entities experienced high percentage growth?

These are examples of the type of questions analysts can answer before building dashboards or reports.

---

# Data Quality Considerations

Before using the dataset for advanced analysis, check:

- Missing entity codes
- Duplicate entity-year records
- Regional aggregate rows
- Historical changes in entity definitions
- Population values
- Year coverage
- Differences between countries and aggregate regions

The dataset documentation notes that Our World in Data performs processing such as standardizing country names and region definitions and calculating derived indicators.

For serious analysis, always review the source metadata before interpreting results.

---

# Project Limitations

1. This project uses a population dataset only; it does not explain the causes of population changes.
2. The dataset contains regions and aggregates in addition to countries.
3. The analysis covers the available historical period rather than providing a custom forecast.
4. Population totals should not automatically be interpreted as country-only totals.
5. Percentage growth can be strongly affected by a small starting population.
6. This project does not include demographic variables such as fertility, mortality, migration, or age structure.

---

# Future Improvements

Possible extensions for an intermediate SQL project:

- Add a country-only analysis by excluding regional aggregates.
- Find the fastest-growing entities by decade.
- Calculate year-over-year population growth.
- Find the largest population decrease in a single year.
- Compare India, China, and the United States.
- Create a population ranking for every year.
- Calculate moving averages.
- Create SQL views for dashboard use.
- Connect the SQL results to Power BI or Tableau.
- Build a population trend dashboard.

---

# Suggested GitHub Repository Description

> **Beginner-friendly MySQL project analyzing global population trends from 1950–2023 using practical SQL queries, aggregations, joins, subqueries, and population growth calculations.**

---

# Author

**MASKYY**

Created as a practical SQL learning and portfolio project.

---

# Data Source & Attribution

The dataset documentation identifies the main source as:

**United Nations, Department of Economic and Social Affairs, Population Division (2024), World Population Prospects 2024, Online Edition.**

The data package was processed and published through **Our World in Data**.

Please retain the original dataset attribution when redistributing or extending this project.

## Source

Our World in Data — Population data package  
United Nations — World Population Prospects 2024

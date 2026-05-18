# Data Analysis & SQL Prompts

Real-world, copy-paste-ready prompts for data work and SQL. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Natural Language to SQL

❌ **Weak Prompt**:
```
Write a SQL query to find top customers.
```

✅ **Strong Prompt**:
```
Convert the following business question to a PostgreSQL query.

Database schema:
- customers(id, name, email, plan, created_at)
- orders(id, customer_id, total, status, created_at)
- order_items(id, order_id, product_id, quantity, price)
- products(id, name, category, price)

Question: "Who are our top 10 customers by total spending in the last 90 days, 
and what's their most frequently purchased product category?"

Requirements:
- Only count orders with status = 'completed'
- Include columns: customer_name, email, plan, total_spent, order_count, top_category
- Format total_spent as currency (2 decimal places)
- Order by total_spent descending
- Add comments explaining each CTE or subquery
```

---

## Example 2 — Analyze Data Patterns

❌ **Weak Prompt**:
```
Analyze this data.
```

✅ **Strong Prompt**:
```
I have the following monthly revenue data for my SaaS product:

| Month    | Revenue ($) | New Customers | Churned |
|----------|-------------|---------------|---------|
| Jan 2024 | 45,000      | 120           | 15      |
| Feb 2024 | 48,500      | 135           | 18      |
| Mar 2024 | 52,000      | 150           | 22      |
| Apr 2024 | 49,800      | 110           | 35      |
| May 2024 | 47,200      | 95            | 40      |
| Jun 2024 | 44,000      | 80            | 45      |

Please:
1. Calculate MRR growth rate, churn rate, and net customer growth for each month
2. Identify the inflection point where growth turned negative
3. Diagnose the most likely cause (show your reasoning)
4. Project the next 3 months if the current trend continues
5. Recommend 3 specific, actionable strategies to reverse the churn trend

Present calculations in tables. Be data-driven, not vague.
```

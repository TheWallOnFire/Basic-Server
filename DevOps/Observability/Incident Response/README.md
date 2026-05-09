# PagerDuty & Opsgenie

## Description
On-call management platforms ensure that the right person is notified when something goes wrong in production. They act as the "Incident Response" hub for DevOps teams.

## How they work
1. **Alerts** are sent from Prometheus/Datadog/Sentry to the platform.
2. The platform checks **on-call schedules** (who is working right now?).
3. It sends **notifications** via SMS, Phone Call, or App Push.
4. If the person doesn't respond, it **escalates** to their manager.

## Comparison

| Feature | PagerDuty | Opsgenie (Atlassian) |
| :--- | :--- | :--- |
| **Market Position** | Industry Leader (Standard) | Strong integration with Jira |
| **Pricing** | High | Included in Jira Service Management |
| **Advanced Features** | Event Orchestration, Analytics | Heartbeats, Incident Commands |
| **Best For** | Pure-play Incident Response | Teams already using Jira/Confluence |

## Why you need this
- **Reduced MTTR** (Mean Time To Resolution).
- **Prevention of "Alert Fatigue"** (Group similar alerts together).
- **Post-Mortem Reports**: Tracking how incidents were handled.
- **Fair On-Call**: Rotating responsibilities across the team.

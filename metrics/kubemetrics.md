# Monitoring Kubernetes layers:


```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```

***Alert Condition Time Range:***

- This parameter defines the time window within which the alert condition is evaluated. It consists of two parts: the start time (now-10m) and the end time (now).
- now represents the current time, and now-10m represents a duration of 10 minutes ago relative to the current time.
- So, "now-10m to now" means you're evaluating the alert condition over the past 10 minutes leading up to the current moment.
- The purpose of this time range is to focus on recent data and detect issues that have occurred within the specified timeframe.

***Max Data Points:***

- This parameter determines the maximum number of data points that Grafana retrieves and evaluates within the specified time range.
- For example, if you set "Max data points" to 100, Grafana will fetch and analyze up to 100 data points within the 10-minute time window defined in your "Alert Condition Time Range."
- The choice of this value depends on factors like the granularity of your data and the desired level of detail in your alert evaluation.
- Setting this too low might lead to false negatives, as not enough data is considered, while setting it too high might increase the load on your data source and Grafana.

***Min Interval:***

- This parameter defines the minimum time interval between data points in the results Grafana retrieves. It is specified in terms of time duration (e.g., 1m for 1 minute).
- For example, if you set "Min interval" to 1m, Grafana ensures that there is at least one data point every minute in the results it fetches for evaluation.
- This parameter helps control the granularity of the data used for alerting. Smaller intervals provide more detailed data but may result in larger datasets, while larger intervals give a coarser view but are more resource-efficient.
- Set this value according to the expected frequency of data updates and the requirements of your specific alert condition.

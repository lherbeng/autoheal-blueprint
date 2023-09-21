# Monitoring Kubernetes layers:

Alert Condition Time Range:

- This parameter defines the time window within which the alert condition is evaluated. It consists of two parts: the start time (now-10m) and the end time (now).
- now represents the current time, and now-10m represents a duration of 10 minutes ago relative to the current time.
- So, "now-10m to now" means you're evaluating the alert condition over the past 10 minutes leading up to the current moment.
- The purpose of this time range is to focus on recent data and detect issues that have occurred within the specified timeframe.

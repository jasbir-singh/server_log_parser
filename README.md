# Problem

The test is as follows:

1. ruby_app
Write a ruby script that:

a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log

b. Returns the following:

> list of webpages with most page views ordered from most pages views to less page views e.g.:

```sh
/home 90 visits
/index 80 visits
...
```

> list of webpages with most unique page views also ordered e.g.:

```sh
/about/2 8 unique views
/index 5 unique views
...
```

# Solution

Running this

```sh
jasbirsingh@rashmirahti ~/w/server_log_parser (master)> ./parser.rb webserver.log
```

outputs

```text
--------------------
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views
--------------------
--------------------
/about/2 90 total views
/contact 89 total views
/index 82 total views
/about 81 total views
/help_page/1 80 total views
/home 78 total views
--------------------
```

# Design

## Overview of the (important) classes

- `ServerLogParser` - Handles the logic for parsing the file.
- `Visits` - This class encapsulates the logic for all of the visits.
- `VisitReports` - Enacapsulates the base logic for creating a report. `UniqueViewsByURL`, and `ToralViewsByURL` are examples of concrete reports that compose with `VisitReports`.
	of reports, which compose with this class to create a report. This design should make it simple to add new reports. (PS: I have also deliberately picked composition over inheritance)
- `ServerLogLineParser` - Enacapsulates logic for parsing each line (performs url validation, and makes sure each line is valid).

# What I would improve? (TODOs)

- Add unit tests for `Parser`, however, it's pretty well covered by integration specs.
- Test the logic on a bigger subset, and measure the performance of `File.readlines`, and see if it handles it well (it should).
- Possibly, check if IP addresses are valid. However, log file would only ever contain valid ip addresses I imagine.
- Add more specs covering more edge cases (i.e. `/home/` and `/home` should be the same?)

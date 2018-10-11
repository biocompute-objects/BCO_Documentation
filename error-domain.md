_This document is part of the [BioCompute Object specification](bco-specification.md)_


## 2.8 Error Domain, acceptable range of variability "error_domain"

The error domain consists of two subdomains: _empirical_ and _algorithmic_.

The **empirical** error subdomain contains the limits of detectability, false positives, false negatives, statistical confidence of outcomes, etc. This can be measured by running the algorithm on multiple data samples of the usability domain or in carefully designed in-silico spiked data. For example, a set of spiked, well-characterized samples can be run through the algorithm to determine the false positives, negatives and limits of detection.

The ***algorithmic** subdomain is descriptive of errors that originated by fuzziness of the algorithms, driven by stochastic processes, in dynamically parallelized multi-threaded executions, or in machine learning methodologies where the state of the machine can affect the outcome.  This can be measured in repeatability experiments of multiple runs or using some rigorous mathematical modeling of the accumulated errors. For example: bootstrapping is frequently used with stochastic simulation based algorithms to accumulate sets of outcomes and estimate statistically significant variability for the results.

For data integration BCOs used to develop knowledgebases the error domain can, for example, contain a records of annotations that did not pass a set of rules.

The possible keys within each subdomains are workflow-specific free text which should be readable for a human.

```json
    "error_domain": {
        "empirical_error": {
            "false negative alignment hits": "<0.0010", 
            "false discovery": "<0.05"
        }, 

        "algorithmic_error": { 
            "false_positive_mutation_calls_discovery": "<0.00005", 
            "false_discovery": "0.005"
        }
    }
```

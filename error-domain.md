_This document is part of the [BioCompute Object specification](bco-specification.md)_


## 2.8 Error Domain, acceptable range of variability "error_domain"

The error domain can be used to determine what range of input returns outputs that are within the tolerance level defined in this subdomain and therefore can be used, for example, to optimize algorithm. It consists of two subdomains: _empirical_ and _algorithmic_.

The **empirical** error subdomain contains empirically determined values such as limits of detectability, false positives, false negatives, statistical confidence of outcomes, etc. This can be measured by running the algorithm on multiple data samples of the usability domain or through the use of carefully designed in-silico data. For example, a set of spiked, well-characterized samples can be run through the algorithm to determine the false positives, negatives, and limits of detection. 

The **algorithmic** subdomain is descriptive of errors that originate by fuzziness of the algorithms, driven by stochastic processes, in dynamically parallelized multi-threaded executions, or in machine learning methodologies where the state of the machine can affect the outcome. This can be measured by taking a random subset of the data and re-running the analysis, or using some rigorous mathematical modeling of the accumulated errors and providing confidence values. For example, bootstrapping is frequently used with stochastic simulation based algorithms to accumulate sets of outcomes and estimate statistically significant variability for the results.

For data integration BCOs used to develop knowledgebases, the error domain can, for example, contain rules that determine inclusion in the knowledgebase and data objects that pass and fail the set of rules.

The possible keys within each subdomains are workflow-specific, free text which should be readable for a human.

```json
    "error_domain": {
        "empirical_error": {
            "false_negative_alignment_hits": "<0.0010", 
            "false_discovery": "<0.05"
        }, 

        "algorithmic_error": { 
            "false_positive_mutation_calls": "<0.00005", 
            "false_discovery": "0.005"
        }
    }
```

# HEAD

Features:

* Token Aware Data Center Aware Round Robin load balancing is used by default
* Automatic detection of broken connections using heartbeats
* Improved exception class hierarchy and documentation

Bug fixes:

* [RUBY-34] handle empty values without crashing
* [RUBY-41] prevent connections to ignored hosts

Breaking changes:

* Most of the error classes have changed, `Cassandra::Errors::QueryError` removed
* Connections to hosts in remote datacenters will be disabled by default
* `Cassandra.connect` has been renamed to `Cassandra.cluster` to avoid confusion
* `Cassandra::TimeUuid::Generator` renamed to `Cassandra::Uuid::Generator` and api has been changed

# 1.0.0.beta.3

Bug fixes:

* [RUBY-35] handle ghost entries in system.peers table (CASSANDRA-7825)

# 1.0.0.beta.2

Features:

* TokenAware load balancing policy
* Domain names
* SSL encryption

Bug fixes:

* [RUBY-8] correctly update host status when down/up events received immediately after each other

Breaking changes:

* `Cassandra::LoadBalancing::Policy#setup` is required to be implemented.
* `Cassandra::Cluster#each_host`, `Cassandra::Cluster#each_keyspace`, `Cassandra::Keyspace#each_table` and `Cassandra::Table#each_column` return `Array` or `self`.

# 1.0.0.beta.1

Features:

* Fully asynchronous API
* Single cluster, multiple sessions
* New statements API (Simple, Prepared, Bound and Batch)
* Per-request execution information and tracing
* Base set of policies for load balancing, retry and reconnection as well as ability to write your own
* Host and Schema metadata and state listeners

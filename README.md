# SheetCode

Sheety clone of LeetCode.

## Local development

Run `mvn spring-boot:run`.

Running `curl localhost:8080/health/ping` should return `ping`.

Code will be hot reloaded on any change.

To disable, uncomment `spring.devtools.livereload.enabled=false`
in `application.properties` file.

## Tech stack

Migrations - Flyway.

Logging - Logback + SL4J.

Instrumentation - OpenTelemetry.

Database interaction - JDBI.

Testing - JUnit5 + TestContainers.

## Migrations

Run migrations via: `mvn flyway:migrate`.

<!-- ## Kubernetes -->

<!-- Install `minikube` - https://minikube.sigs.k8s.io/docs/start. -->

<!-- Install `kubectl` - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux. -->

<!-- Install `k9s` (optional) - https://k9scli.io/topics/install. -->

<!-- ## Elastic -->

<!-- For Observability, Elastic stack is used. Hosted in Kubernetes. -->

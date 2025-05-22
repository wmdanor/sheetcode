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

## Swagger

This application serves OpenAPI JSON available at `/openapi` (http://localhost:8080/openapi).

And Swagger UI at `/swagger-ui/index.html` (http://localhost:8080/swagger-ui/index.html).

## Migrations

Run migrations via: `mvn flyway:migrate`.

### Seed

Seed scripts are located in `src/main/resources/db/seed`.
They should be versioned in a way to avoid collisions with
regular migrations, but come after the version, where seed
application will be possible. Let's say we would like to
create a seed script for that depends on migration version `1.1`,
then seed should be versioned `1.1.1` for example.

In order to apply seed scripts you will need to run migration
command as usual, but using `local` profile: `mvn -Plocal flyway:migrate`.

Seed scripts are intended to only be used for local development.


<!-- ## Kubernetes -->

<!-- Install `minikube` - https://minikube.sigs.k8s.io/docs/start. -->

<!-- Install `kubectl` - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux. -->

<!-- Install `k9s` (optional) - https://k9scli.io/topics/install. -->

<!-- ## Elastic -->

<!-- For Observability, Elastic stack is used. Hosted in Kubernetes. -->

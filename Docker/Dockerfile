FROM mcr.microsoft.com/powershell:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

COPY ["./Docker/migrateForContainer.ps1", "."]
COPY ["./Scripts/migrate.ps1", "."]

ENTRYPOINT ["./migrateForContainer.ps1"]
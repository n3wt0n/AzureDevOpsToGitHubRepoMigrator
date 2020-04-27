FROM mcr.microsoft.com/powershell:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

COPY ["./Docker/migrateForContainer.ps1", "."]
COPY ["./Scripts/migrate-mirror.ps1", "."]

RUN chmod +x migrateForContainer.ps1 && \
    chmod +x migrate-mirror.ps1

ENTRYPOINT ["./migrateForContainer.ps1"]
FROM microsoft/dotnet:2-sdk
ENV NUGET_XMLDOC_MODE skip
WORKDIR /vsdbg

# Installing vsdbg debbuger into our container 
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg

# Copying source files into container and publish it
RUN mkdir /app
WORKDIR /app

COPY ./src/api/api.csproj /app
RUN dotnet restore

COPY ./src/api /app
RUN dotnet publish -c Debug -o out

# Kick off a container just to wait debugger to attach and run the app
ENTRYPOINT ["/bin/bash", "-c", "sleep infinity"]
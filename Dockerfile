FROM alpine AS build
RUN apk add --no-cache wget \
&&	wget https://aka.ms/downloadazcopy-v10-linux -O /tmp/azcopy.tgz \
&&	export BIN_LOCATION=$(tar -tzf /tmp/azcopy.tgz | grep "/azcopy") \
&&	tar -xzf /tmp/azcopy.tgz $BIN_LOCATION --strip-components=1 -C /usr/bin

FROM --platform=linux/amd64 registry.access.redhat.com/ubi8/python-38:1-131
COPY --from=build /usr/bin/azcopy /usr/local/bin/azcopy
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

ENTRYPOINT [ "/bin/bash"]
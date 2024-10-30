FROM golang:1.23.0

WORKDIR /app

COPY go.mod ./
RUN go mod tidy
RUN go mod download

COPY *.go ./

RUN go build -o /p2p-devops-test

EXPOSE 3000

CMD [ "/p2p-devops-test" ]
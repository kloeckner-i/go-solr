# go-solr

Solr client in golang

## Usage

````go
package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/kloeckner-i/go-solr/solr"
)

const coreName = "job"

func main() {
    c := solr.Config{}
    solrClient, err := solr.NewClient(c)
    if err != nil {
        log.Fatal(err)
        return
    }
    if err := solrClient.IsUp(context.Background()); err != nil {
        log.Fatalf("Solr is not up %v", err)
        return
    }
    log.Println("Solr is up")
    solrClient.UseCore(coreName)
    if status, err := solrClient.DefaultCore.Status(context.Background(), false); err != nil {
        log.Fatalf("Check core status failed %v", err)
        return
    } else {
        log.Printf("Got status for core %s %v\n", coreName, status)
    }
}
````
package solr

import (
	"github.com/kloeckner-i/go-solr/solr/util/logutil"
)

var log = logutil.Logger.RegisterPkg()

func init() {
	log.SetPkgAlias("solr")
}

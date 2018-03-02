#!/usr/bin/env bash
set -e

{ 
    find concept -name "*.json" -exec cat {} + |
        jq '{_id: ("concept/"+.ontology+"/"+.id)} + .';
    
    find annotation -name "*.json" -exec cat {} + |
        jq '{_id: ("annotation/"+.language+"/"+.package+"/"+.id)} + .';
} |
    jq -s '.'
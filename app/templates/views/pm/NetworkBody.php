$.getJSON('<?=$networkUrl?>', function(json) {
    var data = {
        nodes: new vis.DataSet(json.nodes),
        edges: new vis.DataSet(json.edges)
    }
    var network = new vis.Network(document.getElementById('<?=$id?>'), data, {
        height: ($(window).height() * 4/5 - 100) + 'px',
        edges: {
            smooth: {
                type: 'cubicBezier',
                roundness: 0.1,
                forceDirection: 'vertical'
            }
        },
        nodes: {
            shape: 'box',
            widthConstraint: {
                maximum: 200
            }
        },
        layout:{
            hierarchical: {
                direction: 'UD',
                nodeSpacing: 200,
                levelSeparation: 250
            }
        },
        physics: false
    });
    network.on('doubleClick', function(e) {
        if (e.nodes.length > 0) {
            $.each(json.nodes, function(index,value) {
                if ( value.id == e.nodes[0] ) {
                    window.open(value.url, '_blank');
                }
            });
        }
    });
    network.on('selectNode', function(e) {
        if (e.nodes.length > 0) {
            $.each(json.edges, function(index,edge) {
                if ( edge.from == e.nodes[0] ) {
                    data.nodes.update([ {
                        id: edge.to,
                        hidden: false
                    }])
                }
            });
        }
    });
    completeUIExt($('<?=$id?>'));
});

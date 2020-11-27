/*
Um nó pode ser representado pela pseudo-estrutura node(Id, Left, Right)
em que Id é o identificador do nodo, Left é o filho esquerdo do nodo
e Right é o filho direito do nodo (cada filho pode ser um átomo ou um nodo).
*/
tree(
    node(1,
        node(2,
            node(3,
                node(4,
                    node(5,
                        australia,
                        node(6,
                            node(7,
                                stahelena,
                                anguila
                            ),
                            georgiadosul
                        )
                    ),
                    reinounido
                ),
                node(8,
                    servia,
                    franca
                )
            ),
            node(9,
                node(10,
                    niger,
                    india
                ),
                irlanda
            )
        ),
        brasil    
    )
).
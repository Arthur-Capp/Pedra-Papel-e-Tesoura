programa
{
	inclua biblioteca Util
	
	funcao cadeia getNomeArma(inteiro objeto){
		escolha(objeto){
			caso 1:
				retorne "Pedra"
			caso 2:
				retorne "Papel"
			caso contrario:
				retorne "Tesoura"
		}
	}

	funcao inteiro getJogadaMaquina(){
		retorne Util.sorteia(1,3)
	}
		
	funcao inteiro avaliarBatalha(inteiro j1, inteiro j2){
		se(j1 == 1 e j2 == 1){
			retorne 0
		}senao{
			se(j1 == 1 e j2 == 2){
				retorne 2
			}senao{
				se(j1 == 1 e j2 == 3){
					retorne 1
				}senao{
					se(j1 == 2 e j2 == 1){
						retorne 1
					}senao{
						se(j1 == 2 e j2 == 2){
							retorne 0
						}senao{
							se (j1 == 2 e j2 == 3){
								retorne 2
							}senao{
								se(j1 == 3 e j2 == 1){
									retorne 2
								}senao{
									se(j1 == 3 e j2 == 2){
										retorne 1
									}senao{
										retorne 0
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	funcao cadeia getNomeVencedor(inteiro resultado){
		escolha(resultado){
			caso 0:
				retorne "Empate"
			caso 1:
				retorne "O Jogador 1 venceu"
			caso contrario:
				retorne "O Jogador 2 venceu"
		}
	}
	
	funcao vazio testar(){
		inteiro i
		inteiro j
		para(i = 1; i<=3; i++){
			para (j = 1; j <= 3; j++){
				escreva(	"J1 = ",getNomeArma(i), " J2 = ", getNomeArma(j), " Resposta = ", getNomeVencedor(avaliarBatalha(i,j))," \n")
			}
		}		
	}

	funcao inteiro exibirMenuJogada(){
		inteiro jogada
		faca{
			limpa()
			escreva("Escolha a sua jogada: \n")
			escreva("1 - Para \"Pedra\" \n")
			escreva("2 - Para \"Papel\" \n")
			escreva("3 - Para \"Tesoura\" \n\n")
			escreva("Digite sua jogada: ")
			leia(jogada)
			escreva("\n")
			se(jogada < 1 ou jogada > 3){
				escreva("Jogada inválida")
				Util.aguarde(1500)
			}
			limpa()
		}enquanto(jogada < 1 ou jogada > 3)
		
		retorne jogada
	}
	funcao cadeia exibirMenuJogarNovamente(){
		cadeia resposta
		faca{
			escreva("\n\n")
			escreva("O jogo acabou :(\n")
			escreva("Deseja jogar novamente? (\"S\" para SIM ou \"N\" para não)\n\n")
			escreva("Digite a sua escolha: ")
			leia(resposta)
		}enquanto(resposta != "S" e resposta !="N")
		retorne resposta
	}

	funcao vazio exibeSplash(){
		
		escreva("Pedra Papel ou Tesoura dos Guris!")
		Util.aguarde(2500)
		limpa()
	}
	funcao vazio qtd_jogadores(inteiro &qtd_jogador){
		escreva("Deseja jogar com 1 ou 2 jogadores : ")
		leia(qtd_jogador)
	}
	funcao cadeia exibePlacarMaquina(inteiro j1, inteiro j2, inteiro empate){
		escreva("\n\n")
		se(j1 > j2 e j1 > empate ){
			retorne "Boa, fez o mínimo!"
		}senao{
			se(j2 > j1 e j2 > empate){
				retorne "Ta perdendo pra máquina Jamelão!"
			}senao{
				se(empate > j1 e empate > j2){
					retorne "Os dois são ruins, teve mais empates."
				}senao{
					se( j1 == j2 ou j1 == empate ou j2 == empate){
						retorne "Joga mais uma pra desempatar, vai!"
					}senao{
						retorne "Ficar no Empate é f@da"
					}
				}
			}	
		}
	}
	funcao cadeia exibePlacarJogador(inteiro j1, inteiro j2, inteiro empate){
		escreva("\n\n")
		se(j1 > j2 e j1 > empate ){
			retorne "IH o jogador 1 ta ganhando, vai deixar?!"
		}senao{
			se(j2 > j1 e j2 > empate){
				retorne "IH o jogador 2 ta ganhando, vai deixar?!"
			}senao{
				se(empate > j1 e empate > j2){
					retorne "Os dois são ruins, teve mais empates."
				}senao{
					se( j1 == j2 ou j1 == empate ou j2 == empate){
						retorne "Joga mais uma pra desempatar, vai!"
					}senao{
						retorne ""
					}
				}
			}	
		}
	}
	funcao vazio placarFinalMaquina (inteiro x, inteiro y, inteiro w){
		escreva("O placar final é de:\n")
		escreva("Jogador 1 = ",x,"\n")
		escreva("Máquina = ",y,"\n")
		escreva("Empates = ",w)
	}
	funcao vazio placarFinalJogadores (inteiro x, inteiro y, inteiro w){
		escreva("O placar final é de:\n")
		escreva("Jogador 1 = ",x,"\n")
		escreva("Jogador 2 = ",y,"\n")
		escreva("Empates = ",w)
	}
	funcao inicio()
	{
		inteiro qtd_jogador
		inteiro j1
		inteiro j2
		cadeia resposta
		inteiro qtd_j1
		inteiro qtd_j2
		inteiro empate
		
		exibeSplash()

		qtd_j1 = 0
		qtd_j2 = 0
		empate = 0
		
		qtd_jogador = -1

		qtd_jogadores(qtd_jogador)

		se(qtd_jogador == 1){
			faca{
				j1 = exibirMenuJogada()
				j2 = getJogadaMaquina()
				
				escreva("Jogador 1 = ",getNomeArma(j1), "\nMáquina = ", getNomeArma(j2), "\nResposta = ", getNomeVencedor(avaliarBatalha(j1,j2))," \n\n")
				
				se(avaliarBatalha(j1,j2) == 1){
					qtd_j1 ++
					escreva("O placar é de: \nJogador 1 = ", qtd_j1, "\nMáquina = ", qtd_j2, "\nEmpates = ", empate) 
				}senao{
					se(avaliarBatalha(j1,j2) == 2){
						qtd_j2++
						escreva("O placar é de: \nJogador 1 = ", qtd_j1, "\nMáquina = ", qtd_j2, "\nEmpates = ", empate)
					}senao{
						empate ++
						escreva("O placar é de: \nJogador 1 = ", qtd_j1, "\nMáquina = ", qtd_j2, "\nEmpates = ", empate)
					}
				}
				
				escreva(exibePlacarMaquina(qtd_j1, qtd_j2, empate))
				resposta = exibirMenuJogarNovamente()
			
			}enquanto(resposta != "N")
			limpa()
			placarFinalMaquina(qtd_j1, qtd_j2, empate)
			
		}senao{
			faca{

				j1 = exibirMenuJogada()
				j2 = exibirMenuJogada()

				escreva(" Jogador 1 = ",getNomeArma(j1), "\n Jogador 2 = ", getNomeArma(j2), "\n Resposta = ", getNomeVencedor(avaliarBatalha(j1,j2)), "\n\n")
				se(avaliarBatalha(j1,j2) == 1){
					qtd_j1 ++
					escreva("O placar é de: \nJogador 1 = ", qtd_j1, "\nJogador 2 = ", qtd_j2, "\nEmpates = ", empate) 
					
				}senao{
					se(avaliarBatalha(j1,j2) == 2){
						qtd_j2++
						escreva("O placar é de: \nJogador 1 = ", qtd_j1, "\nJogador 2 = ", qtd_j2, "\nEmpates = ", empate)
					}senao{
						empate++
						escreva("O placar é de: \nJogador 1 = ", qtd_j1, "\nJogador 2 = ", qtd_j2, "\nEmpates = ", empate)
					}
				}

				escreva(exibePlacarJogador(qtd_j1, qtd_j2, empate))
				resposta = exibirMenuJogarNovamente()
				
			}enquanto(resposta != "N")
			limpa()
			placarFinalJogadores(qtd_j1, qtd_j2, empate)
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4933; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
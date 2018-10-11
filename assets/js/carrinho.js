let Carrinho = {
  init(socket) {
    let channel = socket.channel('carrinho:lobby', {})
    channel.join()
    this.listenForCarrinho(channel)
  },
  listenForCarrinho(channel) {
    document.getElementById('form_cart').addEventListener('submit', function(e){
      e.preventDefault()
      let nome_produto = document.getElementById('nome_produto').value
      let quantidade_produto = document.getElementById('quantidade').value
      let preco_unitario = document.getElementById('preco_unitario').value
      let total = quantidade_produto * preco_unitario


      channel.push('shout', {nome_produto: nome_produto, quantidade: quantidade_produto, preco_unitario: preco_unitario, total: total})

    })

    channel.on('shout', payload => {
      // let carrinho = document.querySelector('#popu')
      // let dados = document.createElement('p')

      // dados.insertAdjacentHTML('beforeend', `<b>${payload.nome_produto}:</b> ${payload.quantidade}`)
      // carrinho.appendChild(dados)
      M.toast({html: 'Item adicionado !', classes: 'rounded'});
    })
  }
}
export default Carrinho

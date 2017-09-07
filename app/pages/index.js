import Layout from '../components/Layout.js'
import TodoList from '../components/TodoList.js'
import fetch from 'isomorphic-unfetch'

const Index = (props) => (
  <Layout>
    <p>Your current shopping list:</p>
    <TodoList items={props.items}/>
  </Layout>
)

Index.getInitialProps = async function() {
  const res = await fetch('http://localhost:4000/api/items')
  const data = await res.json()

  return {
    items: data.items
  }
}

export default Index

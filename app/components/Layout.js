import Link from 'next/link'

export default (props) => (
  <div>
    <h1>Welcome to NextJS!</h1>
    <nav>
      <ul>
        <li><Link href="/"><a>Home</a></Link></li>
        <li><Link href="/about"><a>About</a></Link></li>
      </ul>
    </nav>
    {props.children}
    <style jsx>{`
      nav ul {
        list-style: none;
        padding: 0;
      }

      nav li {
        display: inline;
        margin-right: 10px;
      }
    `}</style>
  </div>
)

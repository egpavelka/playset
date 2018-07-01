export default class SignUp extends React.Component {
  render() {
    return (
        <form onSubmit={ this.props.onSubmitForm }>
        <label htmlFor="">
        <input id="username"
               type="text"
               placeholder="username" />
        </label>
        <label htmlFor="">
        <input id="email"
               type="email"
               placeholder="email address" />
        </label>
        <label htmlFor="">
        <input id="password"
               type="password"
               placeholder="password" />
        </label>
        <label htmlFor="">
        <input id="password_confirmation"
               type="password"
               placeholder="confirm password" />
        </label>
        </form>
    )
  }
}

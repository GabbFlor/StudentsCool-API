import Header_simplificado from '../components/Header-simplificado';
import './styles/Cadastro_feito.css'
import logo from '../assets/imagens/Logo_Retangulo.png'
import { Link } from 'react-router-dom';

const Cadastro_feito = () => {
    return (
        <div className="">
            <Header_simplificado />
            <div className="main_cadastro_feito">
                <div className="container_cadastro_feito">
                    <h1>Obrigado por cadastrar!!</h1>
                    <img src={logo} alt="Logo" className='logo_cadastro_feito'/>
                    <Link to={"/cadastro"}><button className="button_cadastro_feito">Editar minha resposta</button></Link>
                    <a href="*" className='copia_pdf'>pegar uma copia do formulario</a>
                </div>
            </div>
        </div>
    )
}

export default Cadastro_feito;
import Footer from '../components/Footer';
import Header from '../components/Header';
import img_cardapio from "../assets/imagens/cardapio.png"
import './styles/Cardapio.css'
import { Link } from 'react-router-dom';

import Avaliar from '../components/AvaliacaoCardapio'
import { useEffect, useState } from 'react';
import axios from 'axios';


const Cardapio = () => {
    const [imagemBASE64, setImagemBASE64] = useState("");

    useEffect(() => {
        const atualizarImgCardapio = () => {
            axios.get('http://localhost:8080/CardapioImage/1')
            .then(response => {
                setImagemBASE64(response.data.imagem_cardapio);
            });
        };

        atualizarImgCardapio();
    }, [])

    return (
        <div className="">
            <Header />
            <main className="main_cardapio">
                <div className="main_cardapio_top">
                    <div className="container_title_cardapio">
                        <h1 className='title_cardapio'>Veja o cardápio dessa <span className='span_cardapio'>Semana!</span></h1>
                    </div>
                    <img className='img_cardapio' src={imagemBASE64} alt="cardapio" />
                    <div className="button_container_flex">
                        <div className="container_cardapio_button2">
                            <Link to={"/Filtro_cardapio"}><button className="button_cardapio">VEJA AS POÇÔES!</button></Link>
                        </div>
                    </div>
                </div>

                <div>
                    <div className='contStar'>
                        <Avaliar />
                    </div>
                </div>

            </main>
            <Footer />
        </div>
    )
}

export default Cardapio;
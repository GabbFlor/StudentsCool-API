import React, { useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faStar as fullStar, faStarHalfAlt as halfStar, faStar as emptyStar } from '@fortawesome/free-solid-svg-icons';

import Sun from '../assets/imagens/sun_icon.png'
import Talher from '../assets/imagens/talher_icon.png'
import Nuvem from '../assets/imagens/nuven_icon.png'

import './styles/AvaliacaoCardapio.css'

// Componente StarRating (Você já tem esse)
const StarRating = ({ rating, setRating }) => {
    const [hoverRating, setHoverRating] = useState(0);

    const renderStar = (index) => {
        if (hoverRating > 0) {
            if (hoverRating >= index) {
                return fullStar;
            } else if (hoverRating >= index - 0.5) {
                return halfStar;
            } else {
                return emptyStar;
            }
        } else {
            if (rating >= index) {
                return fullStar;
            } else if (rating >= index - 0.5) {
                return halfStar;
            } else {
                return emptyStar;
            }
        }
    };

    const handleMouseOver = (value) => {
        setHoverRating(value);
    };

    const handleMouseLeave = () => {
        setHoverRating(0);
    };

    const handleClick = (value) => {
        setRating(value);
    };

    return (
        <div className="star-rating">
            {[...Array(5)].map((_, i) => {
                const starValue = i + 1;
                return (
                    <span
                        key={starValue}
                        onMouseOver={() => handleMouseOver(starValue)}
                        onMouseLeave={handleMouseLeave}
                        onClick={() => handleClick(starValue)}
                        style={{ cursor: 'pointer', color: (hoverRating >= starValue || rating >= starValue) ? 'yellow' : 'gray' }}
                    >
                        <FontAwesomeIcon icon={renderStar(starValue)} />
                    </span>
                );
            })}
        </div>
    );
};

// Componente para avaliação da Manhã
const AvaliacaoManha = () => {
    const [ratingManha, setRatingManha] = useState(0);

    return (
        <div>
            <div className='title_icon_star'>
                <h3>Manhã</h3>
                <img src={Sun} alt="" className='icon_Star' />
            </div>
            <StarRating rating={ratingManha} setRating={setRatingManha} />
            <p>Avaliação: {ratingManha} Estrelas</p>
        </div>
    );
};

// Componente para avaliação do Almoço
const AvaliacaoAlmoco = () => {
    const [ratingAlmoco, setRatingAlmoco] = useState(0);

    return (
        <div>
            <div className='title_icon_star'>
                <h3>Almoço</h3>
                <img src={Talher} alt="" className='icon_Star' />
            </div>
            <StarRating rating={ratingAlmoco} setRating={setRatingAlmoco} />
            <p>Avaliação: {ratingAlmoco} Estrelas</p>
        </div>
    );
};

// Componente para avaliação da Tarde
const AvaliacaoTarde = () => {
    const [ratingTarde, setRatingTarde] = useState(0);

    return (
        <div>
            <div className='title_icon_star'>
                <h3>Tarde</h3>
                <img src={Nuvem} alt="" className='icon_Star' />
            </div>
            <StarRating rating={ratingTarde} setRating={setRatingTarde} />
            <p>Avaliação: {ratingTarde} Estrelas</p>
        </div>
    );
};

// Componente principal que exibe todas as avaliações
const Avaliacoes = () => {
    return (
        <div className='infosAvalia'>
            <div className='AvaliaPrimeiro'>
                <AvaliacaoManha />
            </div>
            <div className='Avalia'>
                <AvaliacaoAlmoco />
            </div>
            <div className='Avaliaultimo'>
                <AvaliacaoTarde />
            </div>
        </div>
    );
};

export default Avaliacoes;
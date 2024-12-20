package com.studentscool.StudentsCool.adapters.out.persistense;

import com.studentscool.StudentsCool.application.domain.Escola;
import com.studentscool.StudentsCool.application.ports.out.EscolaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
public class EscolaRepositoryImp implements EscolaRepository {

    @Autowired
    private EscolaJpaRepository escolaJpaRepository;

    @Override
    public List<Escola> findAll() {
        return escolaJpaRepository.findAll().stream().map(this::toDomain).collect(Collectors.toList());
    }

    @Override
    public Optional<Escola> findById(Long id) {
        return escolaJpaRepository.findById(id).map(this::toDomain);
    }

    @Override
    public Escola save(Escola escola) {
        EscolaEntity escolaEntity = toEntity(escola);
        return toDomain(escolaJpaRepository.save(escolaEntity));
    }

    @Override
    public void deleteById(Long id) {
        escolaJpaRepository.deleteById(id);
    }

    private Escola toDomain(EscolaEntity entity) {
        Escola escola = new Escola();
        escola.setId(entity.getId());
        escola.setNome(entity.getNome());
        escola.setEmail(entity.getEmail());
        escola.setLocalizacao(entity.getLocalizacao());
        escola.setContato_alt(entity.getContato_alt());
        escola.setQtd_alunos(entity.getQtd_alunos());
        escola.setDias_letivos(entity.getDias_letivos());
        escola.setObservacoes(entity.getObservacoes());
        escola.setAprovado(entity.getAprovado());
        return escola;
    }

    private EscolaEntity toEntity(Escola escola) {
        EscolaEntity entity = new EscolaEntity();
        entity.setId(escola.getId());
        entity.setNome(escola.getNome());
        entity.setEmail(escola.getEmail());
        entity.setLocalizacao(escola.getLocalizacao());
        entity.setContato_alt(escola.getContato_alt());
        entity.setQtd_alunos(escola.getQtd_alunos());
        entity.setDias_letivos(escola.getDias_letivos());
        entity.setObservacoes(escola.getObservacoes());
        entity.setAprovado(escola.getAprovado());
        return entity;
    }

}

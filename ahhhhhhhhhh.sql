use db_atividade_view;

/*1)*/
create or replace view vm_aluno_disciplina as
select aluno.nome nome_aluno, disciplina.nome nome_disciplina, curso.nome nome_curso
from aluno
inner join matricula on aluno.id_aluno = matricula.id_aluno
inner join disciplina on disciplina.id_disciplina = matricula.id_disciplina
inner join curso on curso.id_curso = disciplina.id_curso;

/*2)*/

create or replace view vm_aluno_disciplina2 as
select disciplina.nome, count(aluno.id_aluno) aluno_numero
from matricula
inner join disciplina on disciplina.id_disciplina = matricula.id_disciplina
inner join aluno on aluno.id_aluno = matricula.id_aluno
group by disciplina.nome;

select * from vm_aluno_disciplina2;
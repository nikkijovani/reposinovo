/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "cliente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c")
    , @NamedQuery(name = "Cliente.findByNrTelefone", query = "SELECT c FROM Cliente c WHERE c.nrTelefone = :nrTelefone")
    , @NamedQuery(name = "Cliente.findByNrCpf", query = "SELECT c FROM Cliente c WHERE c.nrCpf = :nrCpf")
    , @NamedQuery(name = "Cliente.findByNrRg", query = "SELECT c FROM Cliente c WHERE c.nrRg = :nrRg")
    , @NamedQuery(name = "Cliente.findByDsSenha", query = "SELECT c FROM Cliente c WHERE c.dsSenha = :dsSenha")
    , @NamedQuery(name = "Cliente.findByDsEmail", query = "SELECT c FROM Cliente c WHERE c.dsEmail = :dsEmail")
    , @NamedQuery(name = "Cliente.findByEndereco", query = "SELECT c FROM Cliente c WHERE c.endereco = :endereco")
    , @NamedQuery(name = "Cliente.findByNmNome", query = "SELECT c FROM Cliente c WHERE c.nmNome = :nmNome")
    , @NamedQuery(name = "Cliente.findById", query = "SELECT c FROM Cliente c WHERE c.id = :id")})
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 100)
    @Column(name = "nr_telefone")
    private String nrTelefone;
    
    @Size(max = 100)
    @Column(name = "nr_cpf")
    private String nrCpf;
    
    @Size(max = 100)
    @Column(name = "nr_rg")
    private String nrRg;
    
    @Size(max = 100)
    @Column(name = "ds_senha")
    private String dsSenha;
    
    @Size(max = 100)
    @Column(name = "ds_email")
    private String dsEmail;
    
    @Size(max = 100)
    @Column(name = "endereco")
    private String endereco;
    
    @Size(max = 100)
    @Column(name = "nm_nome")
    private String nmNome;
    
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name="meugerador", sequenceName = "sq_usuario")
    @Column(name = "id")
    private Integer id;

    public Cliente() {
    }

    public Cliente(Integer id) {
        this.id = id;
    }

    public String getNrTelefone() {
        return nrTelefone;
    }

    public void setNrTelefone(String nrTelefone) {
        this.nrTelefone = nrTelefone;
    }

    public String getNrCpf() {
        return nrCpf;
    }

    public void setNrCpf(String nrCpf) {
        this.nrCpf = nrCpf;
    }

    public String getNrRg() {
        return nrRg;
    }

    public void setNrRg(String nrRg) {
        this.nrRg = nrRg;
    }

    public String getDsSenha() {
        return dsSenha;
    }

    public void setDsSenha(String dsSenha) {
        this.dsSenha = dsSenha;
    }

    public String getDsEmail() {
        return dsEmail;
    }

    public void setDsEmail(String dsEmail) {
        this.dsEmail = dsEmail;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Cliente[ id=" + id + " ]";
    }

}

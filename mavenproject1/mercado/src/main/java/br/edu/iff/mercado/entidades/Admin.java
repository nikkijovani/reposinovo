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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "admin")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admin.findAll", query = "SELECT a FROM Admin a")
    , @NamedQuery(name = "Admin.findByNmNome", query = "SELECT a FROM Admin a WHERE a.nmNome = :nmNome")
    , @NamedQuery(name = "Admin.findByDsSenha", query = "SELECT a FROM Admin a WHERE a.dsSenha = :dsSenha")
    , @NamedQuery(name = "Admin.findByNrCpf", query = "SELECT a FROM Admin a WHERE a.nrCpf = :nrCpf")
    , @NamedQuery(name = "Admin.findByNrTelefone", query = "SELECT a FROM Admin a WHERE a.nrTelefone = :nrTelefone")})
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 100)
    @Column(name = "nm_nome")
    private String nmNome;
    @Size(max = 100)
    @Column(name = "ds_senha")
    private String dsSenha;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nr_cpf")
    private String nrCpf;
    @Size(max = 100)
    @Column(name = "nr_telefone")
    private String nrTelefone;

    public Admin() {
    }

    public Admin(String nrCpf) {
        this.nrCpf = nrCpf;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    public String getDsSenha() {
        return dsSenha;
    }

    public void setDsSenha(String dsSenha) {
        this.dsSenha = dsSenha;
    }

    public String getNrCpf() {
        return nrCpf;
    }

    public void setNrCpf(String nrCpf) {
        this.nrCpf = nrCpf;
    }

    public String getNrTelefone() {
        return nrTelefone;
    }

    public void setNrTelefone(String nrTelefone) {
        this.nrTelefone = nrTelefone;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nrCpf != null ? nrCpf.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admin)) {
            return false;
        }
        Admin other = (Admin) object;
        if ((this.nrCpf == null && other.nrCpf != null) || (this.nrCpf != null && !this.nrCpf.equals(other.nrCpf))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Admin[ nrCpf=" + nrCpf + " ]";
    }
    
}

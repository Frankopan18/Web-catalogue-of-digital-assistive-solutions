package com.fer.hr.onlinecatalogue.catalog.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Katalog")
public class Catalog {

	@Id
	private int id; // primary key must be first coz index are easier to search
	private String naziv;
	private String link;
	private String proizvodjac;
	private String opis;
	private String jezici; // parse it later over , to return list of strings
	@Lob
	private byte[] prikaz; // path to the picture describing certain catalogue item
	private String vrstaPoteskoce;
	private String ICTUredjaj; // parse it over ,
	private String asistivnaTehnologija;
	private String platforma; // parse it as well
	private String cijena; // parse it over : as key,value pairs;trim it before parsing due to white spaces
	private String uporabljivost;
	private String recenzije; // same as with cijena
	private String dostupnost;
	private String vrstaPrimjene;
	private String mjestoPrimjene;



	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getProizvodjac() {
		return proizvodjac;
	}

	public void setProizvodjac(String proizvodjac) {
		this.proizvodjac = proizvodjac;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getJezici() {
		return jezici;
	}

	public void setJezici(String jezici) {
		this.jezici = jezici;
	}

	public byte[] getPrikaz() {
		return prikaz;
	}

	public void setPrikaz(byte[] prikaz) {
		this.prikaz = prikaz;
	}

	public String getVrstaPoteskoce() {
		return vrstaPoteskoce;
	}

	public void setVrstaPoteskoce(String vrstaPoteskoce) {
		this.vrstaPoteskoce = vrstaPoteskoce;
	}

	public String getICTUredjaj() {
		return ICTUredjaj;
	}

	public void setICTUredjaj(String iCTUredjaj) {
		ICTUredjaj = iCTUredjaj;
	}

	public String getAsistivnaTehnologija() {
		return asistivnaTehnologija;
	}

	public void setAsistivnaTehnologija(String asistivnaTehnologija) {
		this.asistivnaTehnologija = asistivnaTehnologija;
	}

	public String getPlatforma() {
		return platforma;
	}

	public void setPlatforma(String platforma) {
		this.platforma = platforma;
	}

	public String getCijena() {
		return cijena;
	}

	public void setCijena(String cijena) {
		this.cijena = cijena;
	}

	public String getUporabljivost() {
		return uporabljivost;
	}

	public void setUporabljivost(String uporabljivost) {
		this.uporabljivost = uporabljivost;
	}

	public String getRecenzije() {
		return recenzije;
	}

	public void setRecenzije(String recenzije) {
		this.recenzije = recenzije;
	}

	public String getDostupnost() {
		return dostupnost;
	}

	public void setDostupnost(String dostupnost) {
		this.dostupnost = dostupnost;
	}

	public String getVrstaPrimjene() {
		return vrstaPrimjene;
	}

	public void setVrstaPrimjene(String vrstaPrimjene) {
		this.vrstaPrimjene = vrstaPrimjene;
	}

	public String getMjestoPrimjene() {
		return mjestoPrimjene;
	}

	public void setMjestoPrimjene(String mjestoPrimjene) {
		this.mjestoPrimjene = mjestoPrimjene;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Catalog [id=" + id + ", naziv=" + naziv + ", link=" + link + ", proizvodjac=" + proizvodjac + ", opis="
				+ opis + ", jezici=" + jezici + ", prikaz=" + Arrays.toString(prikaz) + ", vrstaPoteskoce="
				+ vrstaPoteskoce + ", ICTUredjaj=" + ICTUredjaj + ", asistivnaTehnologija=" + asistivnaTehnologija
				+ ", platforma=" + platforma + ", cijena=" + cijena + ", uporabljivost=" + uporabljivost
				+ ", recenzije=" + recenzije + ", dostupnost=" + dostupnost + ", vrstaPrimjene=" + vrstaPrimjene
				+ ", mjestoPrimjene=" + mjestoPrimjene + "]";
	}




}

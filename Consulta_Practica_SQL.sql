select gmm.id_coche, 
	   ge.nombre , 
	   m2.nombre ,
	   m.nombre,
	   c.fecha_compra,
	   c.matricula,
	   c2.nombre,
	   r.km_revision,
	   cs.nombre,
	   p.numero_poliza
	    
	from cintia_gt.grupo_marca_modelo gmm 
	join cintia_gt.grupo_empresarial ge  on gmm.id_grupo  = ge.id_grupo 
	join cintia_gt.marcas m2  on gmm.id_marcas  = m2.id_marcas 
	join cintia_gt.modelos m on gmm.id_modelo  = m.id_modelo 
	join cintia_gt.coches c on gmm.id_coche = c.id_coche 
	join cintia_gt.color c2  on c.id_color = c2.id_color 
	join cintia_gt.revisiones r on c.id_coche = r.id_coche 
	join cintia_gt.poliza_compania pc on c.id_coche = pc.id_coche 
	join cintia_gt.compania_seguros cs on pc.id_compania = cs.id_compania 
	join cintia_gt.polizas p on pc.id_polizas = p.id_polizas 

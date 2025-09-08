FROM odoo:18.0
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-noto fonts-noto-cjk && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir --break-system-packages -r /tmp/requirements.txt  # ← هذا هو المهم
# COPY addons /mnt/extra-addons
COPY docker/odoo.conf /etc/odoo/odoo.conf
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chown -R odoo:odoo /mnt/extra-addons
USER odoo
ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo","-c","/etc/odoo/odoo.conf"]

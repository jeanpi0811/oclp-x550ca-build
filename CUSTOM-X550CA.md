# OCLP personalizado — ASUS X550CA / Sequoia 15.7.7

Este é um **fork de código do OpenCore Legacy Patcher**, não uma EFI pronta.

## Modificação aplicada

O arquivo `opencore_legacy_patcher/datasets/pci_data.py` agora inclui:

```python
0x0032,  # AR9485 (ASUS X550CA, AzureWave 1A3B:1186)
```

Isso faz o detector classificar o dispositivo PCI `168C:0032` como `AirPortAtheros40`. A lógica existente do OCLP então seleciona automaticamente:

- `corecaptureElCap.kext`;
- `IO80211ElCap.kext`;
- `AirPortAtheros40.kext`;
- o conjunto de patches Legacy Wireless para versões modernas do macOS.

A base existente do OCLP já contém os patches de Sandy Bridge/HD 3000 e o patch de board ID necessário para os frameworks antigos.

## Build no macOS

O build deve ser executado no macOS, porque o projeto usa PyObjC, wxPython, ferramentas Apple e empacotamento de aplicativo macOS:

```sh
cd OpenCore-Legacy-Patcher-X550CA
chmod +x BUILD-X550CA.command
./BUILD-X550CA.command
```

O script instala as dependências e inicia o build para o modelo-base `MacBookPro8,1`, escolhido porque é Sandy Bridge e corresponde à configuração da EFI recebida. No OCLP, a detecção real do hardware Atheros deve ocorrer durante a construção quando o dispositivo estiver visível no macOS.

## Limites

- O OCLP é oficialmente orientado a Macs Apple; Hackintosh é configuração não oficial.
- A HD 3000 permanece não-Metal. No Sequoia, o root patch restaura aceleração legada/OpenGL, não Metal verdadeiro.
- Os root patches precisam ser aplicados novamente após atualizações do macOS.
- O resultado deve ser testado primeiro em pendrive e somente depois instalado na EFI interna.
- O pacote de código não contém a EFI nem substitui a configuração de ACPI, áudio, USB ou SMBIOS do usuário.
